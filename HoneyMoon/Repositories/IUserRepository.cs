using HoneyMoon.Models;
using System.Collections.Generic;

namespace HoneyMoon.Repositories
{
    public interface IUserRepository
    {
        void Add(UserProfile userProfile);
        List<UserProfile> GetAll();
        UserProfile GetByEmail(string email);
        UserProfile GetById(int id);
    }
}