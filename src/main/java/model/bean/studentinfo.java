package model.bean;

public class studentinfo {
    private String studentId;
    private String studentName;
    private String birth;
    private String gender;
    private String favorite;
    private String oldname;
    private String studentsf;
    private String nation;
    private String contry;
    private String ocity;
    private String ncity;
    private String school;
    private String height;
    private String from;
    private String health;
    private String red;
    private String weight;

    public studentinfo() {
        super();
    }
    public studentinfo(String studentId, String studentName, String birth, String gender, String favorite,
                       String oldname, String studentsf, String nation, String sfrom, String contry, String ocity,
                       String ncity, String school, String height, String from, String health, String red, String weight) {
        super();
        this.studentId = studentId;
        this.studentName = studentName;
        this.birth = birth;
        this.gender = gender;
        this.favorite = favorite;
        this.oldname = oldname;
        this.studentsf = studentsf;
        this.nation = nation;
        this.contry = contry;
        this.ocity = ocity;
        this.ncity = ncity;
        this.school = school;
        this.height = height;
        this.from = from;
        this.health = health;
        this.red = red;
        this.weight = weight;
    }
    public String getStudentId() {
        return studentId;
    }
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    public String getStudentName() {
        return studentName;
    }
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getBirth() {
        return birth;
    }
    public void setBirth(String birth) {
        this.birth = birth;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getFavorite() {
        return favorite;
    }
    public void setFavorite(String favorite) {
        this.favorite = favorite;
    }
    public String getOldname() {
        return oldname;
    }
    public void setOldname(String oldname) {
        this.oldname = oldname;
    }
    public String getStudentsf() {
        return studentsf;
    }
    public void setStudentsf(String studentsf) {
        this.studentsf = studentsf;
    }
    public String getNation() {
        return nation;
    }
    public void setNation(String nation) {
        this.nation = nation;
    }
    public String getContry() {
        return contry;
    }
    public void setContry(String contry) {
        this.contry = contry;
    }
    public String getOcity() {
        return ocity;
    }
    public void setOcity(String ocity) {
        this.ocity = ocity;
    }
    public String getNcity() {
        return ncity;
    }
    public void setNcity(String ncity) {
        this.ncity = ncity;
    }
    public String getSchool() {
        return school;
    }
    public void setSchool(String school) {
        this.school = school;
    }
    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }
    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }
    public String getHealth() {
        return health;
    }
    public void setHealth(String health) {
        this.health = health;
    }
    public String getRed() {
        return red;
    }
    public void setRed(String red) {
        this.red = red;
    }
    public String getWeight() {
        return weight;
    }
    public void setWeight(String weight) {
        this.weight = weight;
    }
}
