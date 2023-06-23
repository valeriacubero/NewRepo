namespace ProyectoLenguajes.Models
{
    public class SerieFinal
    {
        public SERIE serie { get; set; }
        public List<ACTOR> actors { get; set; }
        public List<CHAPTER> chapters { get; set; }
        public List<UserSerie> commentsPerPage { get; set; }
        public int totalPages { get; set; }
        public int currentPage { get; set; }
    }
}
