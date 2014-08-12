using System.ComponentModel.DataAnnotations;

namespace WebSite.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "UserName", ResourceType = typeof(Resources.Resources))]
        public string UserName { get; set; }
    }

    public class ManageUserViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "CurrentPassword", ResourceType = typeof(Resources.Resources))]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 6, ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "MinLength")]
        [DataType(DataType.Password)]
        [Display(Name = "NewPassword", ResourceType = typeof(Resources.Resources))]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "ConfirmNewPassword", ResourceType = typeof(Resources.Resources))]
        [Compare("NewPassword", ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "NewPasswordMismatch")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "UserName", ResourceType = typeof(Resources.Resources))]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password", ResourceType = typeof(Resources.Resources))]
        public string Password { get; set; }

        [Display(Name = "RememberMe", ResourceType = typeof(Resources.Resources))]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [Display(Name = "UserName", ResourceType = typeof(Resources.Resources))]
        public string UserName { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 6, ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "MinLength")]
        [DataType(DataType.Password)]
        [Display(Name = "Password", ResourceType = typeof(Resources.Resources))]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "ConfirmPassword", ResourceType = typeof(Resources.Resources))]
        [Compare("Password", ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "PasswordMismatch")]
        public string ConfirmPassword { get; set; }

        [Required]
        [StringLength(255, ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "MaxLength")]
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessageResourceType = typeof(Resources.Resources), ErrorMessageResourceName = "InvalidEmail")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
