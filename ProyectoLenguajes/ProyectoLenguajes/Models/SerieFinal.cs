namespace ProyectoLenguajes.Models
{
    public class SerieFinal
    {
        public SERIE serie { get; set; }
        public List<ACTOR> actors { get; set; }
        public List<UserSerie> reviews { get; set; }
        public List<CHAPTER> chapters { get; set; }
    }
}
