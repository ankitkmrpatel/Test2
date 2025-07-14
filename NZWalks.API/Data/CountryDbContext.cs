using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using NZWalks.API.Models.Domain.Country;

namespace NZWalks.API.Data;

public partial class CountryDbContext : DbContext
{
    public CountryDbContext(DbContextOptions<CountryDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<Region> Regions { get; set; }

    public virtual DbSet<State> States { get; set; }

    public virtual DbSet<Subregion> Subregions { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__cities__3213E83FE6D23EA4");

            entity.ToTable("cities", "world");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsFixedLength()
                .HasColumnName("country_code");
            entity.Property(e => e.CountryId).HasColumnName("country_id");
            entity.Property(e => e.CountryName)
                .HasMaxLength(255)
                .HasColumnName("country_name");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValue(new DateTime(2014, 1, 1, 12, 1, 1, 0, DateTimeKind.Unspecified))
                .HasColumnName("created_at");
            entity.Property(e => e.Flag)
                .HasDefaultValue(true)
                .HasColumnName("flag");
            entity.Property(e => e.Latitude)
                .HasColumnType("decimal(10, 8)")
                .HasColumnName("latitude");
            entity.Property(e => e.Longitude)
                .HasColumnType("decimal(11, 8)")
                .HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.StateCode)
                .HasMaxLength(5)
                .HasColumnName("state_code");
            entity.Property(e => e.StateId).HasColumnName("state_id");
            entity.Property(e => e.StateName)
                .HasMaxLength(255)
                .HasColumnName("state_name");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("updated_at");
            entity.Property(e => e.WikiDataId)
                .HasMaxLength(255)
                .HasColumnName("wikiDataId");

            entity.HasOne(d => d.Country).WithMany(p => p.Cities)
                .HasForeignKey(d => d.CountryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cities_countries");

            entity.HasOne(d => d.State).WithMany(p => p.Cities)
                .HasForeignKey(d => d.StateId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cities_states");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__countrie__3213E83F92DE5CEA");

            entity.ToTable("countries", "world");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Capital)
                .HasMaxLength(255)
                .HasColumnName("capital");
            entity.Property(e => e.CreatedAt).HasColumnName("created_at");
            entity.Property(e => e.Currency)
                .HasMaxLength(255)
                .HasColumnName("currency");
            entity.Property(e => e.CurrencyName)
                .HasMaxLength(255)
                .HasColumnName("currency_name");
            entity.Property(e => e.CurrencySymbol)
                .HasMaxLength(255)
                .HasColumnName("currency_symbol");
            entity.Property(e => e.Emoji)
                .HasMaxLength(191)
                .HasColumnName("emoji");
            entity.Property(e => e.EmojiU)
                .HasMaxLength(191)
                .HasColumnName("emojiU");
            entity.Property(e => e.Flag)
                .HasDefaultValue(true)
                .HasColumnName("flag");
            entity.Property(e => e.Iso2)
                .HasMaxLength(2)
                .IsFixedLength()
                .HasColumnName("iso2");
            entity.Property(e => e.Iso3)
                .HasMaxLength(3)
                .IsFixedLength()
                .HasColumnName("iso3");
            entity.Property(e => e.Latitude)
                .HasColumnType("decimal(10, 8)")
                .HasColumnName("latitude");
            entity.Property(e => e.Longitude)
                .HasColumnType("decimal(11, 8)")
                .HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.Nationality)
                .HasMaxLength(255)
                .HasColumnName("nationality");
            entity.Property(e => e.Native)
                .HasMaxLength(255)
                .HasColumnName("native");
            entity.Property(e => e.NumericCode)
                .HasMaxLength(3)
                .IsFixedLength()
                .HasColumnName("numeric_code");
            entity.Property(e => e.Phonecode)
                .HasMaxLength(255)
                .HasColumnName("phonecode");
            entity.Property(e => e.Region)
                .HasMaxLength(255)
                .HasColumnName("region");
            entity.Property(e => e.RegionId).HasColumnName("region_id");
            entity.Property(e => e.Subregion)
                .HasMaxLength(255)
                .HasColumnName("subregion");
            entity.Property(e => e.SubregionId).HasColumnName("subregion_id");
            entity.Property(e => e.Timezones).HasColumnName("timezones");
            entity.Property(e => e.Tld)
                .HasMaxLength(255)
                .HasColumnName("tld");
            entity.Property(e => e.Translations).HasColumnName("translations");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("updated_at");
            entity.Property(e => e.WikiDataId)
                .HasMaxLength(255)
                .HasColumnName("wikiDataId");

            entity.HasOne(d => d.RegionNavigation).WithMany(p => p.Countries)
                .HasForeignKey(d => d.RegionId)
                .HasConstraintName("FK_countries_regions");

            entity.HasOne(d => d.SubregionNavigation).WithMany(p => p.Countries)
                .HasForeignKey(d => d.SubregionId)
                .HasConstraintName("FK_countries_subregions");
        });

        modelBuilder.Entity<Region>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__regions__3213E83F5CCD1705");

            entity.ToTable("regions", "world");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt).HasColumnName("created_at");
            entity.Property(e => e.Flag)
                .HasDefaultValue(true)
                .HasColumnName("flag");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.Translations).HasColumnName("translations");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("updated_at");
            entity.Property(e => e.WikiDataId)
                .HasMaxLength(255)
                .HasColumnName("wikiDataId");
        });

        modelBuilder.Entity<State>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__states__3213E83F66D83D49");

            entity.ToTable("states", "world");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsFixedLength()
                .HasColumnName("country_code");
            entity.Property(e => e.CountryId).HasColumnName("country_id");
            entity.Property(e => e.CountryName)
                .HasMaxLength(255)
                .HasColumnName("country_name");
            entity.Property(e => e.CreatedAt).HasColumnName("created_at");
            entity.Property(e => e.FipsCode)
                .HasMaxLength(255)
                .HasColumnName("fips_code");
            entity.Property(e => e.Flag)
                .HasDefaultValue(true)
                .HasColumnName("flag");
            entity.Property(e => e.Iso2)
                .HasMaxLength(255)
                .HasColumnName("iso2");
            entity.Property(e => e.Latitude)
                .HasColumnType("decimal(10, 8)")
                .HasColumnName("latitude");
            entity.Property(e => e.Longitude)
                .HasColumnType("decimal(11, 8)")
                .HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.StateCode)
                .HasMaxLength(5)
                .HasColumnName("state_code");
            entity.Property(e => e.Type)
                .HasMaxLength(191)
                .HasColumnName("type");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("updated_at");
            entity.Property(e => e.WikiDataId)
                .HasMaxLength(255)
                .HasColumnName("wikiDataId");

            entity.HasOne(d => d.Country).WithMany(p => p.States)
                .HasForeignKey(d => d.CountryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_states_countries");
        });

        modelBuilder.Entity<Subregion>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__subregio__3213E83F7DA28EE8");

            entity.ToTable("subregions", "world");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt).HasColumnName("created_at");
            entity.Property(e => e.Flag)
                .HasDefaultValue(true)
                .HasColumnName("flag");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.RegionId).HasColumnName("region_id");
            entity.Property(e => e.Translations).HasColumnName("translations");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("updated_at");
            entity.Property(e => e.WikiDataId)
                .HasMaxLength(255)
                .HasColumnName("wikiDataId");

            entity.HasOne(d => d.Region).WithMany(p => p.Subregions)
                .HasForeignKey(d => d.RegionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_subregions_regions");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
