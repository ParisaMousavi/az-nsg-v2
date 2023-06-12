# Push changes in Azure DevOps Repo & GitHub
```
git remote set-url --add --push origin https://p-moosavinezhad@dev.azure.com/p-moosavinezhad/az-iac/_git/az-nsg-v2

git remote set-url --add --push origin https://github.com/ParisaMousavi/az-nsg-v2.git
```

# Push changes in Azure DevOps Repo & GitHub with SSH
```
git remote set-url --add --push origin git@ssh.dev.azure.com:v3/p-moosavinezhad/az-iac/az-nsg-v2az-nsg-v2

git remote set-url --add --push origin git@github.com:ParisaMousavi/az-nsg-v2.git
```


# Create a new tag
```
git tag -a <year.month.day> -m "description"

git push origin <year.month.day>

```
- git tag -a 2022.11.30 -m "aks operation scaling video"; git push origin 2022.11.30;