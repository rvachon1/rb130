class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    point_mutations = 0
    counter = 0

    if @strand.length > strand2.length
      min_strand = strand2
      other_strand = @strand
    else
      min_strand = @strand
      other_strand = strand2
    end

    while counter < min_strand.length
      point_mutations += 1 if min_strand[counter] != other_strand[counter]
      counter += 1
    end

    point_mutations
  end
end