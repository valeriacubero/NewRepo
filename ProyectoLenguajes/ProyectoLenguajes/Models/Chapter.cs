using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class CHAPTER
{
    public int idChapter { get; set; }

    public int numChapter { get; set; }

    public string name { get; set; } = null!;

    public string duration { get; set; } = null!;

    public int season { get; set; }

    public int idSerie { get; set; }

    public string? img { get; set; }

    public string? description { get; set; }

    public virtual SERIE? idSerieNavigation { get; set; } = null!;
}
