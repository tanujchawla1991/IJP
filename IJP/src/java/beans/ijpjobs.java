
package beans;

import java.sql.Date;


public class ijpjobs {
    int no_of_positions;
    String jobtitle,grade,Status,hiring_manager;
    Date postdate;


    public int getNo_of_positions() {
        return no_of_positions;
    }

    public void setNo_of_positions(int no_of_positions) {
        this.no_of_positions = no_of_positions;
    }

    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getHiring_manager() {
        return hiring_manager;
    }

    public void setHiring_manager(String hiring_manager) {
        this.hiring_manager = hiring_manager;
    }

    public Date getPostdate() {
        return postdate;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }
   
   
}
