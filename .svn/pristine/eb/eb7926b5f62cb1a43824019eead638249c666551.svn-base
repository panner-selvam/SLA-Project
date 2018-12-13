package CommonConnection;

import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import CommonConnection.DBCredentialBean;
public class DBCredentials1 {
	DBCredentialBean dbBean = null;
	public DBCredentials1() {
		try {
			XmlBeanFactory beanfactory = new XmlBeanFactory(new ClassPathResource("Credential1.xml"));
			dbBean = (DBCredentialBean) beanfactory.getBean("dbcredentialbean");
			//System.out.println("**************"+dbBean);
					} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getPassword() {
		return dbBean.getPass_word();
	}
	public String getUserName() {
		return dbBean.getUser_Name();
	}
	public String getServerName() {
		return dbBean.getServer_Name();
	}
	public String getPortNumber() {
		return dbBean.getPort_Number();
	}
	public String getDatabaseName() {
		return dbBean.getDatabase_Name();
	}
}
