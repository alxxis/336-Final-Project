package main.java.com.cs336.pkg;




public class Student {
    private String firstName;
    private String lastName;
    private String username;
    private String password;
        public Student(String username, String password) {
            this.username = username;
            this.password = password;
        }

        public String getFirstName() {
            return firstName;
        }

        public String getLastName() {
            return lastName;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() {
            return password;
        }
    }