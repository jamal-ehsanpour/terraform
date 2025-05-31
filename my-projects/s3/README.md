# 🌐 AWS S3 Static Website Module with Terraform 🚀

This Terraform module provisions an **Amazon S3 bucket** configured for **static website hosting**. It includes customizable index and error documents, and outputs the public website URL.

---

## ✨ Features

- 🪣 Creates an **S3 bucket** with website hosting enabled  
- 📄 Customizable **index** and **error** documents  
- 🔓 Automatically sets **public read access**   
- 🌍 Outputs the **website URL** to access it immediately  

---

## 📁 File Structure

```bash
my-projects/s3/
├── main.tf # Core infrastructure
├── variables.tf # Input variables
├── outputs.tf # Module outputs
├── index.html # (Optional) Website homepage
├── error.html # (Optional) Custom error page
```


---

## ⚙️ Input Variables

| Variable         | Type    | Default        | Description |
|------------------|---------|----------------|-------------|
| `bucket_name`     | string  | `null`         | (Optional) Globally unique S3 bucket name. If not set, a random name will be generated. |
| `index_document`  | string  | `"index.html"` | Name of the index document to serve as homepage |
| `error_document`  | string  | `"error.html"` | Name of the custom error page |
| `tags`  | map(string)  | `{}` | Tags for the s3 bucket |


---

## 📤 Outputs

| Output        | Description                             |
|---------------|-----------------------------------------|
| `bucket_name` | Name of the created S3 bucket           |
| `website_url` | Public URL of the hosted static website |

---

## 🚀 Example Usage

```hcl
module "s3_static_website" {
  source         = "./my-projects/s3"
  bucket_name    = "jamal-static-site"
  index_document = "index.html"
  error_document = "error.html"
}

```


🔗 After terraform apply, you'll see output like:
```hcl
website_url = http://jehsan-static-website.s3-website-eu-central-1.amazonaws.com
```
🛠️ Deployment Instructions
1. 🧭 Navigate to the project directory:
```bash
cd my-projects/s3

```

2.🧰 Initialize Terraform:
```bash
terraform init
terraform apply
```

🌍 Visit the output website_url in your browser to view your hosted site!



🧹 Teardown
To destroy all resources created by this module:
```bash
terraform destroy
```

## 👨‍💻 Author

**Jamal Ehsanpour**

- 🐙 [GitHub](https://github.com/jamal-ehsanpour)
- 💼 [LinkedIn](https://linkedin.com/in/jamal-ehsanpour-239563194)
- 🌐 [AWS Portfolio](http://my-portfolio-cicd.s3-website-eu-west-1.amazonaws.com/)



⭐ Support
If you found this project helpful:

⭐ Star the repo

🛠 Fork and customize it

🔄 Share it with your network

