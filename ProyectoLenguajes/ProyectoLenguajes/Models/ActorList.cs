namespace ProyectoLenguajes.Models
{
    public class ActorList
    {
        

        public ActorList(string name, string lastName, DateTime birth)
        {
            this.name = name;
            this.lastName = lastName;
            this.birth = birth;
        }

        

        public string name { get; set; } = null!;

        public string lastName { get; set; } = null!;

        public DateTime birth { get; set; }

        public string? img { get; set; }
      
    }
}
