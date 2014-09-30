using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Runtime.InteropServices;

namespace RFIDReader
{
    public class Mifare1K
    {
        [DllImport("kernel32.dll")]
        static extern void Sleep(int dwMilliseconds);

        [DllImport("MasterRD.dll")]
        static extern int rf_init_com(int port, int baud);

        [DllImport("MasterRD.dll")]
        static extern int rf_ClosePort();

        [DllImport("MasterRD.dll")]
        static extern int rf_antenna_sta(short icdev, byte mode);

        [DllImport("MasterRD.dll")]
        static extern int rf_init_type(short icdev, byte type);

        [DllImport("MasterRD.dll")]
        static extern int rf_request(short icdev, byte mode, ref ushort pTagType);

        [DllImport("MasterRD.dll")]
        static extern int rf_anticoll(short icdev, byte bcnt, IntPtr pSnr, ref byte pRLength);

        [DllImport("MasterRD.dll")]
        static extern int rf_select(short icdev, IntPtr pSnr, byte srcLen, ref sbyte Size);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_authentication2(short icdev, byte mode, byte secnr, IntPtr key);

        [DllImport("MasterRD.dll")]
        static extern int rf_M1_read(short icdev, byte adr, IntPtr pData, ref byte pLen);

        [DllImport("MasterRD.dll")]
        static extern int rf_get_device_number(out ushort pIcdev);

        [DllImport("MasterRD.dll")]
        static extern int rf_beep(short icdev, short msec);

        [DllImport("MasterRD.dll")]
        static extern int rf_light(short icdev, short color);

        bool bConnectedDevice;

        static char[] hexDigits = { 
            '0','1','2','3','4','5','6','7',
            '8','9','A','B','C','D','E','F'};

        // 0 - off; 1 - red; 2 - green; 3 - yellow
        public void ChangeColor(short icdev, short color)
        {
            rf_light(icdev, color);
        }

        public void Beep(short icdev, short duration)
        {
            rf_beep(icdev, duration);
        }

        public short InitializeRFIDReader(int port, int baud)
        {
            ushort uicdev = 0;
            short icdev = 0;

            if(!bConnectedDevice)
            {
                int status;

                status = rf_init_com(port, baud);
                if (0 == status)
                {
                    bConnectedDevice = true;
                    Console.WriteLine("Connect device success!");

                    int deviceStatus = rf_get_device_number(out uicdev);

                    if (deviceStatus == 0)
                    {
                        icdev = short.Parse(uicdev.ToString());
                        rf_beep(icdev, short.Parse("50"));
                    }
                }
                else
                {
                    string strError;
                    bConnectedDevice = false;
                    Console.WriteLine("Connect device failed");
                }
            }
            else{
                rf_ClosePort();
                bConnectedDevice = false;
            }

            return icdev;
        }

        public string ReadCard(short icdev)
        {
            int status;
            byte type = (byte)'A'; // Mifare Type A
            byte mode = 0x52;
            ushort TagType = 0;
            byte bcnt = 0x04;
            IntPtr pSnr;
            byte len = 255;
            sbyte size = 0;

            pSnr = Marshal.AllocHGlobal(1024);

            for (int i = 0; i < 2; i++)
            {
                status = rf_antenna_sta(icdev, 0);
                if (status != 0)
                    continue;

                Sleep(20);
                status = rf_init_type(icdev, type);
                if (status != 0)
                    continue;

                Sleep(20);
                status = rf_antenna_sta(icdev, 1);
                if (status != 0)
                    continue;

                Sleep(50);
                status = rf_request(icdev, mode, ref TagType);
                if (status != 0)
                    continue;

                status = rf_anticoll(icdev, bcnt, pSnr, ref len);
                if (status != 0)
                    continue;

                status = rf_select(icdev, pSnr, len, ref size);
                if (status != 0)
                    continue;

                byte[] szBytes = new byte[len];

                for (int j = 0; j < len; j++)
                {
                    szBytes[j] = Marshal.ReadByte(pSnr, j);
                }

                String m_cardNo = String.Empty;

                for (int q = 0; q < len; q++)
                {
                    m_cardNo += byteHEX(szBytes[q]);
                }

                Marshal.FreeHGlobal(pSnr);
                return m_cardNo;
            }

            Marshal.FreeHGlobal(pSnr);
            throw new Exception("No card detected");
        }

        public string ReadBlock(short icdev, char type, string keyB, int sectorNumber, int blockNumber)
        {
            int status;
            byte mode = (byte)0x60;
            if (type == 'B')
                mode = (byte)0x61;
            byte secnr = Convert.ToByte(sectorNumber);

            IntPtr keyBuffer = Marshal.AllocHGlobal(1024);

            byte[] bytesKey = ToDigitsBytes(keyB);
            for (int i = 0; i < bytesKey.Length; i++)
                Marshal.WriteByte(keyBuffer, i, bytesKey[i]);

            status = rf_M1_authentication2(icdev, mode, (byte)(secnr * 4), keyBuffer);
            Marshal.FreeHGlobal(keyBuffer);

            if (status != 0)
            {
                throw new Exception("Authentication failed!");
            }

            IntPtr dataBuffer = Marshal.AllocHGlobal(1024);
            for (int i = 0; i < 4; i++)
            {
                int j;
                byte cLen = 0;
                status = rf_M1_read(icdev, (byte)((secnr * 4) + i), dataBuffer, ref cLen);

                if (status != 0 || cLen != 16)
                {
                    Marshal.FreeHGlobal(dataBuffer);
                    throw new Exception("rf_M1_read failed!");
                }

                byte[] bytesData = new byte[16];
                for (j = 0; j < bytesData.Length; j++)
                    bytesData[j] = Marshal.ReadByte(dataBuffer, j);

                if (i == blockNumber)
                    return ToHexString(bytesData);
            }

            throw new Exception("Unsucessful Read!");
        }

        private static byte GetHexBitsValue(byte ch)
        {
            byte sz = 0;
            if (ch <= '9' && ch >= '0')
                sz = (byte)(ch - 0x30);
            if (ch <= 'F' && ch >= 'A')
                sz = (byte)(ch - 0x37);
            if (ch <= 'f' && ch >= 'a')
                sz = (byte)(ch - 0x57);

            return sz;
        }
        //

        #region byteHEX
        private static String byteHEX(Byte ib)
        {
            String _str = String.Empty;
            try
            {
                char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
			    'B', 'C', 'D', 'E', 'F' };
                char[] ob = new char[2];
                ob[0] = Digit[(ib >> 4) & 0X0F];
                ob[1] = Digit[ib & 0X0F];
                _str = new String(ob);
            }
            catch (Exception)
            {
                new Exception("Unsuccessful byte to hex convertion!");
            }
            return _str;

        }
        #endregion

        private static string ToHexString(byte[] bytes)
        {
            String hexString = String.Empty;
            for (int i = 0; i < bytes.Length; i++)
                hexString += byteHEX(bytes[i]);

            return hexString;
        }

        private static byte[] ToDigitsBytes(string theHex)
        {
            byte[] bytes = new byte[theHex.Length / 2 + (((theHex.Length % 2) > 0) ? 1 : 0)];
            for (int i = 0; i < bytes.Length; i++)
            {
                char lowbits = theHex[i * 2];
                char highbits;

                if ((i * 2 + 1) < theHex.Length)
                    highbits = theHex[i * 2 + 1];
                else
                    highbits = '0';

                int a = (int)GetHexBitsValue((byte)lowbits);
                int b = (int)GetHexBitsValue((byte)highbits);
                bytes[i] = (byte)((a << 4) + b);
            }

            return bytes;
        }
    }
}