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
    
    public partial class Address
    {
        public Address()
        {
            this.Facility = new HashSet<Facility>();
            this.PersonalDetails = new HashSet<PersonalDetails>();
        }
    
        public int Id { get; set; }
        public string Country { get; set; }
        public string Town { get; set; }
        public string PostCode { get; set; }
        public string Address1 { get; set; }
    
        public virtual ICollection<Facility> Facility { get; set; }
        public virtual ICollection<PersonalDetails> PersonalDetails { get; set; }
    }
}
