![alt text](0.t-version.jpg)

Task 1
1. Запускаю init
![alt text](<1.1 t-init.jpg>)

2. Секреты разрешено хранить согласно gitignore в personal.auto.tfvars
3. ![alt text](<1.3. rando,_pass.jpg>)
4. ![alt text](<1.4 errors.jpg>)

- В блоке resource "docker_image" не хватает имени ресурса
- В блоке resource "docker_container" "1nginx" имя должно начинаться с буквы.
- в name  = "example_${random_password.random_string_FAKE.resulT}" не верно указаны параметры _FAKE.resulT
5. Исправленный код
 ![alt text](<1.5 new-code.jpg>)

 Вывод команды docker ps
 ![alt text](1.5docker-ps.jpg)

 6. ключ auto-approve опасен тем, что нет предпросмотра изменений и возможны потери данных. В моем случае контейнер удалился, но новый не создался из-за конфликта портов. После повторного запуска создался новый.
 ![alt text](<1.6 unable-to-create.jpg>)

 ![alt text](<1.6 new-auto-aprove.jpg>)

 7.Содержимое tfstate после terraform destroy
 ![alt text](<1.7 tf-state.jpg>)

 8. docker image не удалился потому что у него было указано  "keep_locally = true"
 В документации написано - keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

 Task 2
 Вывод переменых
 ![alt text](<2.1 env.jpg>)

 Конфигурация main.tf

 [text](main.tf)