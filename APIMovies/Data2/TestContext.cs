using System;
using System.Collections.Generic;
using APIMovies.Models;
using Microsoft.EntityFrameworkCore;

namespace APIMovies.Data2;

public partial class TestContext : DbContext
{
    public TestContext()
    {
    }

    public TestContext(DbContextOptions<TestContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Icon> Icons { get; set; }

    public virtual DbSet<MOVIE> MOVIEs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=163.178.173.130;Database=IF5100_B84545;TrustServerCertificate=True; User Id=basesdedatos; Password=rpbases.2022");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<Icon>(entity =>
        {
            entity.HasKey(e => e.idIcon).HasName("PK__Icons__B2F2F12E0BEA8F00");

            entity.Property(e => e.nameIcon)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.url)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MOVIE>(entity =>
        {
            entity.HasKey(e => e.idMovie).HasName("PK__MOVIE__1A9A9792EBD2EE77");

            entity.ToTable("MOVIE");

            entity.Property(e => e.description)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.director)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.distributor)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.duration)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.img)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.trailer)
                .HasMaxLength(5000)
                .IsUnicode(false);
            entity.Property(e => e.year).HasColumnType("date");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
