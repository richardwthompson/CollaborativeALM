<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head><meta http-equiv='Content-Type' content='text/html;charset=UTF-8' />
	<link href='style.css' rel='stylesheet' type='text/css' />
	</head>
	<body>

	<h2>Test Header</h2>

	<table border="1">
	<xsl:for-each select="TESTINSTANCE">	
	<tr>
		<td>TestSetID</td>
		<td><xsl:value-of select="@TESTSETNAME"/></td>
	</tr>
	<tr>
		<td>TestCaseID</td>
		<td><xsl:value-of select="@TSTESTID"/></td>
	</tr>
	<tr>
		<td>TestName</td>
		<td><xsl:value-of select="@TSTESTNAME"/></td>
	</tr>
	<tr>
		<td>Tags</td>
		<td>
		<xsl:for-each select="TAGS">
			<xsl:for-each select="TAG">
				<xsl:value-of select="TAG"/> x
			</xsl:for-each>
		</xsl:for-each>
		</td>
	</tr>
	</xsl:for-each>
	</table>
	
	<h2>Test Details</h2>
	
	<table border="1">
	<xsl:for-each select="TESTINSTANCE/COMPONENT">
	<tr>
		<td><xsl:value-of select="@NAME"/></td>

		<xsl:for-each select="ITERATION">
			<td>
			<table>
			<xsl:for-each select="PARAM">
				<tr>
				<xsl:if test="string-length(@VALUE) > 0">
					<td><xsl:value-of select="@NAME"/></td>
					<td><font color='blue'><xsl:value-of select="@VALUE"/></font></td>
				</xsl:if>
				</tr>
			</xsl:for-each>
			</table>
			</td>
		</xsl:for-each>
	</tr>

	</xsl:for-each>
	</table>

	</body>
	</html>
	
</xsl:template>
</xsl:stylesheet>