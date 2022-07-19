with score_comparison as (

  select * from {{ source('fandango', 'fandango_score_comparison') }}
    
),

final as (

  select
      md5("FILM") as movie_id,
      "FILM" as movie_name,
      "ROTTENTOMATOES" as rotten_tomatoes_score,
      "ROTTENTOMATOES_USER" as rotten_tomatoes_user,
      "METACRITIC" as metacritic_score,
      "METACRITIC_USER" as metacritic_user,
      "IMDB" as imdb_score,
      "FANDANGO_STARS" as fandango_stars,
      "FANDANGO_RATINGVALUE" as fandango_rating_value,
      "RT_NORM" as rotten_tomatoes_norm,
      "RT_USER_NORM" as rotten_tomatoes_user_norm,
      "METACRITIC_NORM" as metacritic_norm,
      "METACRITIC_USER_NOM" as metacritic_user_nom,
      "IMDB_NORM" as imdb_norm,
      "RT_NORM_ROUND" as rotten_tomatoes_norm_round,
      "METACRITIC_NORM_ROUND" as metacritic_norm_round,
      "METACRITIC_USER_NORM_ROUND" as metacritic_user_norm_round,
      "IMDB_NORM_ROUND" as imdb_norm_round,
      "METACRITIC_USER_VOTE_COUNT" as metacritic_user_vote_count,
      "IMDB_USER_VOTE_COUNT" as imdb_user_vote_count,
      "FANDANGO_VOTES" as fandango_votes,
      "FANDANGO_DIFFERENCE" as fandango_difference

  from score_comparison

)

select * from final