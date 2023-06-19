namespace ProyectoLenguajes.Models
{
    using System.ComponentModel.DataAnnotations;
    public class AddEpisode
    {
        [Key]
        public int idChapter { get; set; }

        public int numChapter { get; set; }

        public string nameC { get; set; } = null!;

        public string duration { get; set; } = null!;

        public int season { get; set; }

        [Display(Name = "idSerie")]
        public int idSerie { get; set; }

        public string img { get; set; }

        public string description { get; set; }
    }
}
