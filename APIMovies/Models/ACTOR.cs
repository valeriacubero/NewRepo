using System;
using System.Collections.Generic;

namespace APIMovies.Models;

public partial class ACTOR
{
    public int idActor { get; set; }

    public string name { get; set; } = null!;

    public string lastName { get; set; } = null!;

    public DateTime birth { get; set; }

    public string? img { get; set; }
}
