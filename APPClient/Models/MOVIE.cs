namespace APPClient.Models
{
    public class MOVIE
    {
        public int idMovie { get; set; }

        public string name { get; set; }

        public string duration { get; set; }

        public DateTime year { get; set; }

        public string director { get; set; }

        public string? distributor { get; set; }

        public string img { get; set; }

        public string? description { get; set; }

        public string? trailer { get; set; }

        public double? punctuation { get; set; }
    }
}
