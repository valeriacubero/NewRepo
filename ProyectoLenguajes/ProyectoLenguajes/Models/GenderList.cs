namespace ProyectoLenguajes.Models
{
    public class GenderList
    {
        public GenderList(string typeG)
        {
            this.typeG = typeG;
        }

        public string typeG { get; set; } = null!;
    }
}
