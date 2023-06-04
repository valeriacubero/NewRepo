using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class ACCOUNT
{
    public int idAccount { get; set; }

    public string name { get; set; } = null!;

    public string email { get; set; } = null!;

    public string? roll { get; set; }

    public string userName { get; set; } = null!;

    public string password { get; set; } = null!;

    public string? img { get; set; }
}
