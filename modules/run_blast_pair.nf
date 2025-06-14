process RUN_BLAST_PAIR {
    tag "${a.id2}_vs_${b.id2}"

    publishDir('results', mode: 'copy')

    container 'ryansonder/samap-blast:latest'

    input:
        tuple val(a), val(b)
        path data_dir

    output:
        path "maps/*/*_to_*.txt"

    script:
    """
    echo Running BLAST for ${a.id2} vs ${b.id2}
    map_genes.sh \\
        --tr1 ${a.fasta} --t1 ${a.type} --n1 ${a.id2} \\
        --tr2 ${b.fasta} --t2 ${b.type} --n2 ${b.id2}
    """
}
