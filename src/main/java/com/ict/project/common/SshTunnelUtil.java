package com.ict.project.common;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class SshTunnelUtil {
	public static void setupSshTunnel() throws JSchException {
		JSch jsch = new JSch();
		jsch.addIdentity("C:\\test.ppk");

		Session session = jsch.getSession("ubuntu", "138.2.116.2", 22);
		session.setConfig("StrictHostKeyChecking", "no");
		session.connect();
		session.setPortForwardingL(3307, "127.0.0.1", 3306);
	}
}
