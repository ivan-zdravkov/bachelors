﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RFIDReader
{
    public class AccessControlModel
    {
        public short Icdev { get; set; }

        public string CardNumber { get; set; }

        public string UserDetails { get; set; }
    }
}
