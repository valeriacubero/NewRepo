using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class GenderSerie
{
    public int idGender { get; set; }

    public int idSerie { get; set; }

    public virtual GENDER idGenderNavigation { get; set; } = null!;

    public virtual SERIE idSerieNavigation { get; set; } = null!;
}
