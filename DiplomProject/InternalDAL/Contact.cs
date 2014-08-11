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
    
    public partial class Contact
    {
        public Contact()
        {
            this.Facility = new HashSet<Facility>();
            this.PersonalDetails = new HashSet<PersonalDetails>();
        }
    
        public int Id { get; set; }
        public string Phone { get; set; }
        public string GSM { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
        public string LastModifiedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedAt { get; set; }
    
        public virtual ICollection<Facility> Facility { get; set; }
        public virtual ICollection<PersonalDetails> PersonalDetails { get; set; }
    }
}
