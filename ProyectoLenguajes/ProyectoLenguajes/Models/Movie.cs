using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class MOVIE
{
    public int idMovie { get; set; }

    public string name { get; set; } = null!;

    public string duration { get; set; } = null!;

    public DateTime year { get; set; }

    public string director { get; set; } = null!;

    public string distributor { get; set; }

    public string img { get; set; }

    public string description { get; set; }

    public string trailer { get; set; }
}
