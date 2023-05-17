using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class GenderMovie
{
    public int idGender { get; set; }

    public int idMovie { get; set; }

    public virtual GENDER idGenderNavigation { get; set; } = null!;

    public virtual MOVIE idMovieNavigation { get; set; } = null!;
}
