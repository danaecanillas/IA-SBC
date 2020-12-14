#!/usr/bin/env python
# coding: utf-8

# # MoM

# In[10]:


import pandas as pd
import random
random.seed(1234)


# In[12]:


url = 'https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv'
df = pd.read_csv(url)
df.shape


# In[13]:


df.head()


# In[14]:


df.describe()


# In[15]:


df = df[pd.notna(df.Artist)]
df = df[~df.ConstituentID.str.contains(",")]
df = df[df.ConstituentID!='8595']
df.shape


# ## Artists

# In[24]:


import re


# In[16]:


artists = df[['ConstituentID', 'Artist', 'Nationality', 'BeginDate', 'EndDate', 'Gender']]
artists.rename(columns={'ConstituentID':'ID', 'Artist':'Name'}, inplace=True)
artists = artists.drop_duplicates()
artists


# In[17]:


NATIONALITIES = [n[1:-1] for n in artists.Nationality.unique() if n!='()']
GENDERS = ['male', 'female', 'non-binary']


# In[18]:


artists['Nationality'] = artists.Nationality.apply(lambda n: n[1:-1] if n != '()' else random.choice(NATIONALITIES))
artists['BeginDate'] = artists.BeginDate.apply(lambda d: int(d[1:-1]) if d != '()' and d != '(0)' else -1)
artists['EndDate'] = artists.EndDate.apply(lambda d: int(d[1:-1]) if d != '()' and d != '(0)' else -1)
artists['Gender'] = artists.Gender.apply(lambda g: g[1:-1].lower() if g != '()' else random.choice(GENDERS))
artists


# In[19]:


artists['BeginDate'] = artists.BeginDate.apply(lambda d: random.randint(1700,2000) if d==-1 else d)
EndDate = artists.apply(lambda r: r.BeginDate+random.randint(20,100) if r.EndDate==-1 else r.EndDate, axis=1)


# In[20]:


artists['EndDate'] = EndDate
artists.tail(20)


# In[238]:


artists.to_csv('artists.csv', index=False)


# ## Artworks

# In[239]:


df.columns


# In[43]:


artworks = df[['ConstituentID', 'Title', 'Date', 'Medium', 'Width (cm)', 'Height (cm)']]
artworks.rename(columns={'ConstituentID':'ArtistID'}, inplace=True)
artworks = artworks.drop_duplicates()
artworks = artworks[artworks.Title != 'Untitled']
artworks


# In[44]:


def fix_date(date, artist):
    """
    """
    if type(date) == str:
        year = re.search(r'[12]\d{3}', date)
        if year:
            return int(year.group(0))
        return random_year_from_artist(artist)
    elif type(date) != int:
        return random_year_from_artist(artist)
    return date

def random_year_from_artist(artist):
    """
    """
    try:
        data = artists[artists.ID==artist].iloc[0]
    except:
        return -1
    return random.randint(data.BeginDate, data.EndDate)
    


# In[ ]:





# In[45]:


artworks['Date'] = artworks.apply(lambda r: fix_date(r['Date'], r['ArtistID']), axis=1)
artworks


# In[46]:


artworks[artworks.Title=='Lobster Pick']


# In[47]:


artworks.shape


# In[48]:


artworks.Date.unique()


# In[49]:


ARTISTS_IDS = artists.ID.unique()


# In[50]:


artworks = artworks[artworks.ArtistID.isin(ARTISTS_IDS)]
artworks.shape


# In[51]:


artworks


# ### Style, relevance and room

# In[52]:


N_RELEVANCES = 5
N_ROOMS = 10


# In[53]:


styles = ["Barroco", "Clasicismo", "Romanticismo", "Cubismo", "Surrealismo", "Expresionismo", "Arte Naif",
          "Abstractismo", "Arte Pop", "Fauvismo"]
relevances = list(range(1,N_RELEVANCES+1))
rooms = list(range(1,N_ROOMS+1))


# In[54]:


artist_ids = list(set(artists.ID))
artist_data = {artist_id : {"styles": random.sample(styles, 2), 
                            "room":  random.choice(rooms)}
               for artist_id in artist_ids}


# In[55]:


artworks['style'] = artworks.ArtistID.apply(lambda a: random.choice(artist_data[a]["styles"]))
artworks['room'] = artworks.ArtistID.apply(lambda a: artist_data[a]["room"])
artworks['relevance'] = random.choices(relevances, weights=[30,30,20,15,5], k=len(artworks))


# In[56]:


artworks


# In[57]:


artworks.to_csv('artworks.csv', index=False)


# In[39]:


random.choices(styles, k=20)


# In[ ]:




