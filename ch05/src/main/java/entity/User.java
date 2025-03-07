package entity;

public class User {
	private String uid;
	private String Pass;
	private String name;
	private int age;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", Pass=" + Pass + ", name=" + name + ", age=" + age + "]";
	}
}
