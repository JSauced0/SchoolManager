using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Escuela.API.Models
{
    public partial class EscuelaContext : DbContext
    {
        public EscuelaContext()
        {
        }

        public EscuelaContext(DbContextOptions<EscuelaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Alumnos> Alumnos { get; set; }
        public virtual DbSet<Asignaciones> Asignaciones { get; set; }
        public virtual DbSet<Grados> Grados { get; set; }
        public virtual DbSet<Grupos> Grupos { get; set; }
        public virtual DbSet<Maestros> Maestros { get; set; }
        public virtual DbSet<Materias> Materias { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("workstation id=Escuela.mssql.somee.com;packet size=4096;user id=edfloreshz_SQLLogin_1;pwd=uuu9nyz1sc;data source=Escuela.mssql.somee.com;persist security info=False;initial catalog=Escuela");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Alumnos>(entity =>
            {
                entity.Property(e => e.Expediente)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.GrupoNavigation)
                    .WithMany(p => p.Alumnos)
                    .HasForeignKey(d => d.Grupo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Alumnos_Grupos");
            });

            modelBuilder.Entity<Asignaciones>(entity =>
            {
                entity.HasOne(d => d.GradoNavigation)
                    .WithMany(p => p.Asignaciones)
                    .HasForeignKey(d => d.Grado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Asignaciones_Grados");

                entity.HasOne(d => d.MateriaNavigation)
                    .WithMany(p => p.Asignaciones)
                    .HasForeignKey(d => d.Materia)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Asignaciones_Materias");
            });

            modelBuilder.Entity<Grados>(entity =>
            {
                entity.Property(e => e.Grado)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Grupos>(entity =>
            {
                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.GradoNavigation)
                    .WithMany(p => p.Grupos)
                    .HasForeignKey(d => d.Grado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Grupos_Grados");

                entity.HasOne(d => d.MaestroNavigation)
                    .WithMany(p => p.Grupos)
                    .HasForeignKey(d => d.Maestro)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Grupos_Maestro");
            });

            modelBuilder.Entity<Maestros>(entity =>
            {
                entity.Property(e => e.Apellido)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Direccion)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Expediente)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Numero)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Materias>(entity =>
            {
                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
