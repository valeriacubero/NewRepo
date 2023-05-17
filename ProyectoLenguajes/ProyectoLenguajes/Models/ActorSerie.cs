using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class ActorSerie
{
    public int idActor { get; set; }

    public int idSerie { get; set; }

    public virtual ACTOR idActorNavigation { get; set; } = null!;

    public virtual SERIE idSerieNavigation { get; set; } = null!;
}
