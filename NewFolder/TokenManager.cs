using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;


namespace KazerBariWeb.NewFolder
{
    public class TokenManager : ITokenManager
    {
        private readonly JWTSettings _jwtsettings;

        public TokenManager(IOptions<JWTSettings> jwtSettings)
        {
            _jwtsettings = jwtSettings.Value;
        }

        // public RefreshTokenForCustomer GenerateRefreshToken()
        // {
        //     RefreshTokenForCustomer refreshToken = new RefreshTokenForCustomer();

        //     var randomNumber = new byte[32];
        //     using (var rng = RandomNumberGenerator.Create())
        //     {
        //         rng.GetBytes(randomNumber);
        //         refreshToken.Token = Convert.ToBase64String(randomNumber);
        //     }
        //     refreshToken.ExpiryDate = DateTime.UtcNow.AddMonths(6);

        //     return refreshToken;
        // }

        public string GenerateAccessToken(int userId,string EmailAddress, string Role)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtsettings.SecretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new System.Security.Claims.Claim[]
                {
                    new System.Security.Claims.Claim(ClaimTypes.Name, Convert.ToString(userId)),
                    new System.Security.Claims.Claim(ClaimTypes.Email, EmailAddress),
                    new System.Security.Claims.Claim(ClaimTypes.Role, Role)
                }),
                Expires = DateTime.UtcNow.AddMonths(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),
                SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
            
        }

        public void GenerateHash(string Password, out byte[] PasswordHash, out byte[] PasswordSalt)
        {
            using (var hash = new System.Security.Cryptography.HMACSHA512())
            {
                PasswordHash = hash.ComputeHash(Encoding.UTF8.GetBytes(Password));
                PasswordSalt = hash.Key;
            }
        }
        public bool ValidateHash(string password, byte[] passwordhash, byte[] passwordsalt)
        {
            using (var hash = new System.Security.Cryptography.HMACSHA512(passwordsalt))
            {
                var newPassHash = hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                for (int i = 0; i < newPassHash.Length; i++)
                    if (newPassHash[i] != passwordhash[i])
                        return false;
            }
            return true;
        }
    }
}
