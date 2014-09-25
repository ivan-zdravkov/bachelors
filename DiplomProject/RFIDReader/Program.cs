using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace RFIDReader
{
    public class RFIDReader
    {
        public static string baseUri = "http://localhost:3761/";
        //public static string baseUri = "http://83.148.87.159/TUFitness/";

        public static string URI = "http://localhost:3761/api/AccessControl/CardDetected";
        //public static string URI = "http://83.148.87.159/TUFitness/api/AccessControl/CardDetected";

        public static string lastCardRead = String.Empty;

        public static void Main(string[] args)
        {
            while (true)
            {
                Mifare1K reader = new Mifare1K();

                int portNumber = int.Parse(args[0]);
                int baud = int.Parse(args[1]);
                string keyB = args[2];

                short icdev = 0;

                try
                {
                    icdev = reader.InitializeRFIDReader(portNumber, baud);
                    reader.ChangeColor(icdev, 2);
                }
                catch (Exception ex)
                {
                    continue;
                }

                while (true)
                {
                    try
                    {
                        string cardNumber = reader.ReadCard(icdev);
                        if (cardNumber == lastCardRead)
                        {
                            continue;
                        }

                        string userDetails = reader.ReadBlock(icdev, 'B', keyB, 0, 0);

                        bool successful = PostData(icdev, cardNumber, userDetails);
                        if (successful)
                        {
                            reader.Beep(icdev, 10);
                            reader.ChangeColor(icdev, 1);
                            lastCardRead = cardNumber;
                            Thread.Sleep(2000);
                            reader.ChangeColor(icdev, 2);
                        }
                        else
                        {
                            reader.ChangeColor(icdev, 1);
                            reader.Beep(icdev, 99);
                            Thread.Sleep(2000);
                            reader.ChangeColor(icdev, 2);
                        }
                    }
                    catch (Exception ex)
                    {
                        Thread.Sleep(200);
                        continue;
                    }
                }
            }
        }

        public static bool PostData(short icdev, string cardNumber, string userDetails)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(baseUri);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    AccessControlModel model = new AccessControlModel
                    {
                        Icdev = icdev,
                        CardNumber = cardNumber,
                        UserDetails = userDetails
                    };

                    HttpResponseMessage response = client.PostAsJsonAsync("api/AccessControl/CardDetected", model).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }  
        }
    }
}
