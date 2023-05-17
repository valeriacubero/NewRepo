using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class UserMovie
{
    public int idUser { get; set; }

    public int idMovie { get; set; }

    public DateTime? times { get; set; }

    public int stars { get; set; }

    public string? review { get; set; }

    public virtual MOVIE idMovieNavigation { get; set; } = null!;

    public virtual ACCOUNT idUserNavigation { get; set; } = null!;
}
