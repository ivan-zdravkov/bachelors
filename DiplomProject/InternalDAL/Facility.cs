//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InternalDAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Facility
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ManagerId { get; set; }
        public int AddressId { get; set; }
        public int ContactId { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
        public string LastModifiedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedAt { get; set; }
    
        public virtual Address Address { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Contact Contact { get; set; }
    }
}
