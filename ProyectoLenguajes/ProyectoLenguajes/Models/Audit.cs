namespace ProyectoLenguajes.Models
{
    public class Audit
    {
        public int idAudit;
        public string action;
        public DateTime date;
        public string tableName;
        public string nameOf;
        public int idOf;
        public string description;
        public int idUser;
    }
}
