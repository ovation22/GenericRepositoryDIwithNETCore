using Microsoft.EntityFrameworkCore;

namespace Example.Models
{
    public class ExampleContext : DbContext
    {
        public ExampleContext(DbContextOptions<ExampleContext> options)
            : base(options)
        { }

        public virtual DbSet<Color> Colors { get; set; }

        public virtual DbSet<Horse> Horses { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Horse>()
                .HasOne(p => p.Color)
                .WithMany(b => b.Horses)
                .HasForeignKey(p => p.ColorId)
                .IsRequired();

            modelBuilder.Entity<Horse>()
                .HasMany(p => p.SireOffspring)
                .WithOne(b => b.Sire)
                .HasForeignKey(p => p.SireId);

            modelBuilder.Entity<Horse>()
                .HasMany(p => p.DamOffspring)
                .WithOne(b => b.Dam)
                .HasForeignKey(p => p.DamId);
        }
    }
}