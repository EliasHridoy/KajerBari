 using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KazerBariWeb.NewFolder
{
    public interface ITokenManager
    {
        // RefreshTokenForCustomer GenerateRefreshToken();
        string GenerateAccessToken(int userId, string EmailAddress, string Role);
        void GenerateHash(String Password, out byte[] PasswordHash, out byte[] PasswordSalt);
        bool ValidateHash(string password, byte[] passwordhash, byte[] passwordsalt);
    }
}
