using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class UserSerie
{
    public int idUser { get; set; }

    public int idSerie { get; set; }

    public DateTime? times { get; set; }

    public int stars { get; set; }

    public string? review { get; set; }

    public virtual SERIE idSerieNavigation { get; set; } = null!;

    public virtual ACCOUNT idUserNavigation { get; set; } = null!;
}
