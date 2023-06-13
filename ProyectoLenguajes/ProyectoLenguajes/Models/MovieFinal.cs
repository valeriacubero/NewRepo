namespace ProyectoLenguajes.Models
{
    public class MovieFinal
    {
        public MOVIE movie { get; set; }
        public List<ACTOR> actors { get; set; }

        public List<UserMovie> reviews { get; set; }
    }
}
