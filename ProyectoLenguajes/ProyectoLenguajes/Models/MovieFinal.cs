namespace ProyectoLenguajes.Models
{
    public class MovieFinal
    {
        public MOVIE movie { get; set; }
        public List<ACTOR> actors { get; set; }
        public List<UserMovie> commentsPerPage { get; set; }
        public int totalPages { get; set; }
        public int currentPage { get; set; }
    }
}
