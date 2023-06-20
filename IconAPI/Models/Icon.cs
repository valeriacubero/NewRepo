using System;
using System.Collections.Generic;

namespace IconAPI.Models;

public partial class Icon
{
    public int idIcon { get; set; }

    public string nameIcon { get; set; } = null!;

    public string url { get; set; } = null!;
}
