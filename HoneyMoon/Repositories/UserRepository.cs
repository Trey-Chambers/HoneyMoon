using HoneyMoon.Models;
using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using HoneyMoon.Utils;



namespace HoneyMoon.Repositories
{
    public class UserRepository : BaseRepository, IUserRepository
    {
        public UserRepository(IConfiguration configuration) : base(configuration) { }

        public List<UserProfile> GetAll()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
SELECT id, firstName, lastName, username, email, isAdmin
FROM UserProfile";
                    var reader = cmd.ExecuteReader();
                    var users = new List<UserProfile>();
                    while (reader.Read())
                    {
                        users.Add(new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "id"),
                            FirstName = DbUtils.GetString(reader, "firstName"),
                            LastName = DbUtils.GetString(reader, "lastName"),
                            UserName = DbUtils.GetString(reader, "username"),
                            Email = DbUtils.GetString(reader, "email"),
                            IsAdmin = DbUtils.GetBoolean(reader, "isAdmin")
                        });
                    }
                    reader.Close();

                    return users;
                }
            }
        }
        public UserProfile GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
SELECT up.id, up.firstName, up.lastName, up.username, up.email, up.isAdmin
FROM UserProfile up WHERE up.id = @Id";
                    DbUtils.AddParameter(cmd, "@Id", id);
                    var reader = cmd.ExecuteReader();

                    UserProfile user = null;
                    if(reader.Read())
                    {
                        user = new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "id"),
                            FirstName = DbUtils.GetString(reader, "firstName"),
                            LastName = DbUtils.GetString(reader, "lastName"),
                            UserName = DbUtils.GetString(reader, "username"),
                            Email = DbUtils.GetString(reader, "email"),
                            IsAdmin = DbUtils.GetBoolean(reader, "isAdmin")
                        };
                    }
                    reader.Close();

                    return user;
                }
            }
        }
        public UserProfile GetByEmail(string email)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd =conn.CreateCommand())
                {
                    cmd.CommandText = @"
SELECT up.id, up.firstName, up.lastName, up.username, up.email, up.isAdmin
FROM UserProfile up
WHERE up.email = @email
";
                    DbUtils.AddParameter(cmd, "@email", email);

                    UserProfile userProfile = null;

                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userProfile = new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "id"),
                            FirstName = DbUtils.GetString(reader, "firstName"),
                            LastName = DbUtils.GetString(reader, "lastName"),
                            UserName = DbUtils.GetString(reader, "username"),
                            Email = DbUtils.GetString(reader, "email"),
                            IsAdmin = DbUtils.GetBoolean(reader, "isAdmin")
                        };
                    }
                    reader.Close();
                    return userProfile;
                }
            }
        }

        public void Add(UserProfile userProfile)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
INSERT INTO UserProfile (firstName, lastName, username, email, isAdmin)
OUTPUT INSERTED.ID
VALUES (@FirstName, @LastName, @UserName, @Email, @IsAdmin)";
                    DbUtils.AddParameter(cmd, "@FirstName", userProfile.FirstName);
                    DbUtils.AddParameter(cmd, "@LastName", userProfile.LastName);
                    DbUtils.AddParameter(cmd, "@UserName", userProfile.UserName);
                    DbUtils.AddParameter(cmd, "@Email", userProfile.Email);
                    DbUtils.AddParameter(cmd, "@IsAdmin", userProfile.IsAdmin);

                    userProfile.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

    }
}
