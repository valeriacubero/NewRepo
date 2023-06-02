using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class SERIE
{
    public int idSerie { get; set; }

    public string name { get; set; } = null!;

    public int seasons { get; set; }

    public DateTime year { get; set; }

    public string director { get; set; } = null!;

    public string? distributor { get; set; }

    public string? img { get; set; }

    public string? description { get; set; }

    public virtual ICollection<CHAPTER> CHAPTERs { get; set; } = new List<CHAPTER>();
}
