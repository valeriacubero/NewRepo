using System;
using System.Collections.Generic;

namespace ProyectoLenguajes.Models;

public partial class AUDIT
{
    public int idAudit { get; set; }

    public string action { get; set; } = null!;

    public DateTime? date { get; set; }

    public string tableName { get; set; } = null!;

    public string nameOf { get; set; } = null!;

    public int idOf { get; set; }

    public string? description { get; set; }

    public int idUser { get; set; }
}
