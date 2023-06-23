namespace ProyectoLenguajes.Models
{
    using System.ComponentModel.DataAnnotations;
    public class AddMovie
    {
        [Key]
        // MOVIE DATA
        public int idMovie { get; set; }

        public string name { get; set; } = null!;

        public string duration { get; set; } = null!;

        public DateTime year { get; set; }

        public string director { get; set; } = null!;

        public string? distributor { get; set; }

        public string? img { get; set; }

        public string? description { get; set; }

        public string? trailer { get; set; }

        // ACTOR DATA
        public string nameA1 { get; set; } = null!;

        public string lastName1 { get; set; } = null!;

        public string? imgA1 { get; set; }

        public DateTime birth1 { get; set; }
        public string? nameA2 { get; set; } = null!;

        public string? lastName2 { get; set; } = null!;
        public string? imgA2 { get; set; }

        public DateTime ? birth2 { get; set; }
        public string? nameA3 { get; set; } = null!;

        public string? lastName3 { get; set; } = null!;
        public string? imgA3 { get; set; }

        public DateTime ? birth3 { get; set; }
        //public List<ACTOR> actors { get; set; }

        // GENRE DATA
        public string typeG1 { get; set; } = null!;
        public string? typeG2 { get; set; } = null!;
        public string? typeG3 { get; set; } = null!;
        //public List<GENDER> genders { get; set; }
    }
}
