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
    
    public partial class Assessment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Assessment()
        {
            this.MultiQuestions = new HashSet<MultiQuestion>();
        }
    
        public int asID { get; set; }
        public string asName { get; set; }
        public string asDetails { get; set; }
        public string asQuestionType { get; set; }
        public Nullable<int> asTotalMarks { get; set; }
        public Nullable<int> asTime { get; set; }
        public string asDueDate { get; set; }
        public Nullable<int> studID { get; set; }
        public Nullable<int> tutorId { get; set; }
    
        public virtual Student Student { get; set; }
        public virtual Tutor Tutor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MultiQuestion> MultiQuestions { get; set; }
    }
}
