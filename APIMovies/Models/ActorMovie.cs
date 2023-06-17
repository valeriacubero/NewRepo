using System;
using System.Collections.Generic;

namespace APIMovies.Models;

public partial class ActorMovie
{
    public int idActor { get; set; }

    public int idMovie { get; set; }

    public virtual ACTOR idActorNavigation { get; set; } = null!;

    public virtual MOVIE idMovieNavigation { get; set; } = null!;
}
