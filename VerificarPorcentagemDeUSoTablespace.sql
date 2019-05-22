SELECT a.TABLESPACE_NAME "Nome do Tablespace",
	round(a.BYTES / 1024 / 1024) "MB Alocados",
	round((a.BYTES - nvl(b.BYTES, 0)) / 1024 / 1024) "MB Usados",
	nvl(round(b.BYTES / 1024 / 1024), 0) "MB Livre",
	round(((a.BYTES - nvl(b.BYTES, 0)) / a.BYTES) * 100, 2) "% Usados",
	round((1 - ((a.BYTES - nvl(b.BYTES, 0)) / a.BYTES)) * 100, 2) "% Livre"
FROM (SELECT TABLESPACE_NAME,
	sum(BYTES) BYTES
	FROM dba_data_files
	GROUP BY TABLESPACE_NAME)a,
	(SELECT TABLESPACE_NAME,
		sum(BYTES)BYTES
		FROM sys.dba_free_space
		GROUP BY TABLESPACE_NAME)b
		WHERE a.TABLESPACE_NAME = b.TABLESPACE_NAME(+)
		ORDER BY ((a.BYTES-b.BYTES) / a.BYTES);
		