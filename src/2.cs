namespace DefaultNamespace;
// Добавлена владицая пароля и возможность работы с хешированными паролями, а также улучшена обработка ошибок.
public class 2 {
    [HttpGet]
    public async Task<IActionResult> Login(string email, string password)
    {
        var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == email);

        if (user == null || !VerifyPassword(user.Password, password))
        {
            ViewBag.ErrorMessage = "Неверная попытка входа.";
            return View();
        }

        var claims = new[]
        {
            new Claim(ClaimTypes.Name, user.Email),
            new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new Claim(ClaimTypes.Role, user.Role)
        };

        var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        var principal = new ClaimsPrincipal(identity);

        await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
        return RedirectToAction("Messages");
    }

    private bool VerifyPassword(string hashedPassword, string enteredPassword)
    {
        return BCrypt.Net.BCrypt.Verify(enteredPassword, hashedPassword);
    }
}