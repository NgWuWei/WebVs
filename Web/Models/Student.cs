//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            this.Assessments = new HashSet<Assessment>();
            this.Groups = new HashSet<Group>();
        }
    
        public int studID { get; set; }
        public string studName { get; set; }
        public string studEmail { get; set; }
        public string studPass { get; set; }
        public string studBirthdate { get; set; }
        public Nullable<int> studScore { get; set; }
        public string studGrade { get; set; }
        public string studGender { get; set; }
        public Nullable<int> courseID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Assessment> Assessments { get; set; }
        public virtual Course Cours { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Group> Groups { get; set; }
    }
}
